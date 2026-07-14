(* V60 case-study module *)
(* PATTERN: record-to-tuple *)
(* TRANSFER_SHAPE: section/retraction *)

Module V60_RecordTuple.
Record point := mkPoint { x : nat; y : nat }.

Definition to_pair (p : point) : nat * nat := (x p, y p).
Definition from_pair (q : nat * nat) : point := mkPoint (fst q) (snd q).
Definition weight_point (p : point) : nat := x p + y p.
Definition weight_pair (q : nat * nat) : nat := fst q + snd q.

Theorem from_to_point : forall p : point, from_pair (to_pair p) = p.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem to_from_pair : forall q : nat * nat, to_pair (from_pair q) = q.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem weight_transfer : forall p : point, weight_pair (to_pair p) = weight_point p.
Proof.
  intros [a b].
  reflexivity.
Qed.
End V60_RecordTuple.

