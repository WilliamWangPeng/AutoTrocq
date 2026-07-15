import json
import tempfile
import unittest
from pathlib import Path

from autotrocq.core import SpecError, batch, generate, infer_strength, policy_decision


class StrengthTests(unittest.TestCase):
    def test_infers_equivalence_from_two_directions(self):
        laws = [{"kind": "section"}, {"kind": "retraction"}]
        self.assertEqual(infer_strength(laws), "equivalence")

    def test_rejects_missing_required_law(self):
        with self.assertRaises(SpecError):
            infer_strength([], "section")


class PolicyTests(unittest.TestCase):
    def test_blocked_axiom_is_safe_reject(self):
        decision = policy_decision(
            {"required_axioms": ["funext"], "policy": {"allowed_axioms": []}}
        )
        self.assertEqual(decision.outcome, "safe_reject")
        self.assertEqual(decision.blocked_axioms, ("funext",))


class GenerationTests(unittest.TestCase):
    def test_generates_manifest_and_coq_source(self):
        spec = {
            "module": "IdentityPackage",
            "source_type": "nat",
            "target_type": "nat",
            "relation": "eq",
            "requested_strength": "plain",
            "required_axioms": [],
            "policy": {"allowed_axioms": []},
            "definitions": [],
            "laws": [],
        }
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            spec_path = root / "spec.json"
            spec_path.write_text(json.dumps(spec), encoding="utf-8")
            report = generate(spec_path, root / "build")
            self.assertEqual(report["policy_outcome"], "accept")
            self.assertTrue((root / "build" / "IdentityPackage.v").is_file())
            self.assertTrue((root / "build" / "IdentityPackage.manifest.json").is_file())

    def test_safe_reject_writes_manifest_but_no_coq_source(self):
        spec = {
            "module": "BlockedPackage",
            "source_type": "nat",
            "target_type": "nat",
            "relation": "eq",
            "requested_strength": "plain",
            "required_axioms": ["functional_extensionality"],
            "policy": {"allowed_axioms": []},
            "definitions": [],
            "laws": [],
        }
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            spec_path = root / "blocked.json"
            spec_path.write_text(json.dumps(spec), encoding="utf-8")
            report = generate(spec_path, root / "build")
            self.assertEqual(report["policy_outcome"], "safe_reject")
            self.assertEqual(report["source_spec"], "blocked.json")
            self.assertFalse((root / "build" / "BlockedPackage.v").exists())
            self.assertTrue((root / "build" / "BlockedPackage.manifest.json").is_file())


class BatchTests(unittest.TestCase):
    def test_batch_partitions_acceptance_and_safe_rejection(self):
        accepted = {
            "module": "AcceptedBatchPackage",
            "source_type": "nat",
            "target_type": "nat",
            "relation": "eq",
            "requested_strength": "plain",
            "required_axioms": [],
            "policy": {"allowed_axioms": []},
            "definitions": [],
            "laws": [],
        }
        blocked = dict(accepted)
        blocked.update(
            {
                "module": "BlockedBatchPackage",
                "required_axioms": ["functional_extensionality"],
            }
        )
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            specs = root / "specs"
            specs.mkdir()
            (specs / "accepted.json").write_text(json.dumps(accepted), encoding="utf-8")
            (specs / "blocked.json").write_text(json.dumps(blocked), encoding="utf-8")
            summary = batch(specs, root / "build", replay_accepted=False)
            self.assertEqual(summary["status"], "success")
            self.assertEqual(summary["specifications"], 2)
            self.assertEqual(summary["outcomes"]["accepted_generated"], 1)
            self.assertEqual(summary["outcomes"]["safe_reject_policy_blocked"], 1)
            self.assertTrue((root / "build" / "batch_results.csv").is_file())
            self.assertTrue((root / "build" / "batch_summary.json").is_file())


if __name__ == "__main__":
    unittest.main()
