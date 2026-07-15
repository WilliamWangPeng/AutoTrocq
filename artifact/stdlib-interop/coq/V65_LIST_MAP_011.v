(* V65 standard-library interoperability module *)
(* FAMILY: list-map *)
(* OBLIGATIONS: 2 *)

Module V65_LIST_MAP_011.
Require Import Coq.Lists.List.
Import ListNotations.

Definition encode_11 (xs : list nat) : list nat := map (fun x => x) xs.

Theorem encode_id_11 : forall xs : list nat, encode_11 xs = xs.
Proof.
  intro xs.
  unfold encode_11.
  now rewrite map_id.
Qed.

Theorem encode_length_11 : forall xs : list nat, length (encode_11 xs) = length xs.
Proof.
  intro xs.
  unfold encode_11.
  now rewrite map_length.
Qed.
End V65_LIST_MAP_011.

