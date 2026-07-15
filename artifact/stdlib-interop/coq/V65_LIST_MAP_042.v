(* V65 standard-library interoperability module *)
(* FAMILY: list-map *)
(* OBLIGATIONS: 2 *)

Module V65_LIST_MAP_042.
Require Import Coq.Lists.List.
Import ListNotations.

Definition encode_42 (xs : list nat) : list nat := map (fun x => x) xs.

Theorem encode_id_42 : forall xs : list nat, encode_42 xs = xs.
Proof.
  intro xs.
  unfold encode_42.
  now rewrite map_id.
Qed.

Theorem encode_length_42 : forall xs : list nat, length (encode_42 xs) = length xs.
Proof.
  intro xs.
  unfold encode_42.
  now rewrite map_length.
Qed.
End V65_LIST_MAP_042.

