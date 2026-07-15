(* V65 standard-library interoperability module *)
(* FAMILY: list-map *)
(* OBLIGATIONS: 2 *)

Module V65_LIST_MAP_001.
Require Import Coq.Lists.List.
Import ListNotations.

Definition encode_1 (xs : list nat) : list nat := map (fun x => x) xs.

Theorem encode_id_1 : forall xs : list nat, encode_1 xs = xs.
Proof.
  intro xs.
  unfold encode_1.
  now rewrite map_id.
Qed.

Theorem encode_length_1 : forall xs : list nat, length (encode_1 xs) = length xs.
Proof.
  intro xs.
  unfold encode_1.
  now rewrite map_length.
Qed.
End V65_LIST_MAP_001.

