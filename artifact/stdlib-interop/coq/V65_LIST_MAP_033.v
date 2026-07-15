(* V65 standard-library interoperability module *)
(* FAMILY: list-map *)
(* OBLIGATIONS: 2 *)

Module V65_LIST_MAP_033.
Require Import Coq.Lists.List.
Import ListNotations.

Definition encode_33 (xs : list nat) : list nat := map (fun x => x) xs.

Theorem encode_id_33 : forall xs : list nat, encode_33 xs = xs.
Proof.
  intro xs.
  unfold encode_33.
  now rewrite map_id.
Qed.

Theorem encode_length_33 : forall xs : list nat, length (encode_33 xs) = length xs.
Proof.
  intro xs.
  unfold encode_33.
  now rewrite map_length.
Qed.
End V65_LIST_MAP_033.

