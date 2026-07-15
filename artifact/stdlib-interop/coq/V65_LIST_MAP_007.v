(* V65 standard-library interoperability module *)
(* FAMILY: list-map *)
(* OBLIGATIONS: 2 *)

Module V65_LIST_MAP_007.
Require Import Coq.Lists.List.
Import ListNotations.

Definition encode_7 (xs : list nat) : list nat := map (fun x => x) xs.

Theorem encode_id_7 : forall xs : list nat, encode_7 xs = xs.
Proof.
  intro xs.
  unfold encode_7.
  now rewrite map_id.
Qed.

Theorem encode_length_7 : forall xs : list nat, length (encode_7 xs) = length xs.
Proof.
  intro xs.
  unfold encode_7.
  now rewrite map_length.
Qed.
End V65_LIST_MAP_007.

