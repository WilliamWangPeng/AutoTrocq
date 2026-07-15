(* V65 standard-library interoperability module *)
(* FAMILY: list-map *)
(* OBLIGATIONS: 2 *)

Module V65_LIST_MAP_010.
Require Import Coq.Lists.List.
Import ListNotations.

Definition encode_10 (xs : list nat) : list nat := map (fun x => x) xs.

Theorem encode_id_10 : forall xs : list nat, encode_10 xs = xs.
Proof.
  intro xs.
  unfold encode_10.
  now rewrite map_id.
Qed.

Theorem encode_length_10 : forall xs : list nat, length (encode_10 xs) = length xs.
Proof.
  intro xs.
  unfold encode_10.
  now rewrite map_length.
Qed.
End V65_LIST_MAP_010.

