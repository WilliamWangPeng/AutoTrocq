(* V65 standard-library interoperability module *)
(* FAMILY: list-map *)
(* OBLIGATIONS: 2 *)

Module V65_LIST_MAP_028.
Require Import Coq.Lists.List.
Import ListNotations.

Definition encode_28 (xs : list nat) : list nat := map (fun x => x) xs.

Theorem encode_id_28 : forall xs : list nat, encode_28 xs = xs.
Proof.
  intro xs.
  unfold encode_28.
  now rewrite map_id.
Qed.

Theorem encode_length_28 : forall xs : list nat, length (encode_28 xs) = length xs.
Proof.
  intro xs.
  unfold encode_28.
  now rewrite map_length.
Qed.
End V65_LIST_MAP_028.

