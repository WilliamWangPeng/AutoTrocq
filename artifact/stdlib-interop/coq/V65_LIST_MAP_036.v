(* V65 standard-library interoperability module *)
(* FAMILY: list-map *)
(* OBLIGATIONS: 2 *)

Module V65_LIST_MAP_036.
Require Import Coq.Lists.List.
Import ListNotations.

Definition encode_36 (xs : list nat) : list nat := map (fun x => x) xs.

Theorem encode_id_36 : forall xs : list nat, encode_36 xs = xs.
Proof.
  intro xs.
  unfold encode_36.
  now rewrite map_id.
Qed.

Theorem encode_length_36 : forall xs : list nat, length (encode_36 xs) = length xs.
Proof.
  intro xs.
  unfold encode_36.
  now rewrite map_length.
Qed.
End V65_LIST_MAP_036.

