(* V65 standard-library interoperability module *)
(* FAMILY: list-map *)
(* OBLIGATIONS: 2 *)

Module V65_LIST_MAP_031.
Require Import Coq.Lists.List.
Import ListNotations.

Definition encode_31 (xs : list nat) : list nat := map (fun x => x) xs.

Theorem encode_id_31 : forall xs : list nat, encode_31 xs = xs.
Proof.
  intro xs.
  unfold encode_31.
  now rewrite map_id.
Qed.

Theorem encode_length_31 : forall xs : list nat, length (encode_31 xs) = length xs.
Proof.
  intro xs.
  unfold encode_31.
  now rewrite map_length.
Qed.
End V65_LIST_MAP_031.

