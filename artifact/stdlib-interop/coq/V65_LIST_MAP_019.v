(* V65 standard-library interoperability module *)
(* FAMILY: list-map *)
(* OBLIGATIONS: 2 *)

Module V65_LIST_MAP_019.
Require Import Coq.Lists.List.
Import ListNotations.

Definition encode_19 (xs : list nat) : list nat := map (fun x => x) xs.

Theorem encode_id_19 : forall xs : list nat, encode_19 xs = xs.
Proof.
  intro xs.
  unfold encode_19.
  now rewrite map_id.
Qed.

Theorem encode_length_19 : forall xs : list nat, length (encode_19 xs) = length xs.
Proof.
  intro xs.
  unfold encode_19.
  now rewrite map_length.
Qed.
End V65_LIST_MAP_019.

