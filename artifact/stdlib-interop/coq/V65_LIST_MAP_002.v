(* V65 standard-library interoperability module *)
(* FAMILY: list-map *)
(* OBLIGATIONS: 2 *)

Module V65_LIST_MAP_002.
Require Import Coq.Lists.List.
Import ListNotations.

Definition encode_2 (xs : list nat) : list nat := map (fun x => x) xs.

Theorem encode_id_2 : forall xs : list nat, encode_2 xs = xs.
Proof.
  intro xs.
  unfold encode_2.
  now rewrite map_id.
Qed.

Theorem encode_length_2 : forall xs : list nat, length (encode_2 xs) = length xs.
Proof.
  intro xs.
  unfold encode_2.
  now rewrite map_length.
Qed.
End V65_LIST_MAP_002.

