(* V65 standard-library interoperability module *)
(* FAMILY: list-map *)
(* OBLIGATIONS: 2 *)

Module V65_LIST_MAP_018.
Require Import Coq.Lists.List.
Import ListNotations.

Definition encode_18 (xs : list nat) : list nat := map (fun x => x) xs.

Theorem encode_id_18 : forall xs : list nat, encode_18 xs = xs.
Proof.
  intro xs.
  unfold encode_18.
  now rewrite map_id.
Qed.

Theorem encode_length_18 : forall xs : list nat, length (encode_18 xs) = length xs.
Proof.
  intro xs.
  unfold encode_18.
  now rewrite map_length.
Qed.
End V65_LIST_MAP_018.

