(* V65 standard-library interoperability module *)
(* FAMILY: list-map *)
(* OBLIGATIONS: 2 *)

Module V65_LIST_MAP_013.
Require Import Coq.Lists.List.
Import ListNotations.

Definition encode_13 (xs : list nat) : list nat := map (fun x => x) xs.

Theorem encode_id_13 : forall xs : list nat, encode_13 xs = xs.
Proof.
  intro xs.
  unfold encode_13.
  now rewrite map_id.
Qed.

Theorem encode_length_13 : forall xs : list nat, length (encode_13 xs) = length xs.
Proof.
  intro xs.
  unfold encode_13.
  now rewrite map_length.
Qed.
End V65_LIST_MAP_013.

