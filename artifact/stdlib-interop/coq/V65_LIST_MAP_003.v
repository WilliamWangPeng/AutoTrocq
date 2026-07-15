(* V65 standard-library interoperability module *)
(* FAMILY: list-map *)
(* OBLIGATIONS: 2 *)

Module V65_LIST_MAP_003.
Require Import Coq.Lists.List.
Import ListNotations.

Definition encode_3 (xs : list nat) : list nat := map (fun x => x) xs.

Theorem encode_id_3 : forall xs : list nat, encode_3 xs = xs.
Proof.
  intro xs.
  unfold encode_3.
  now rewrite map_id.
Qed.

Theorem encode_length_3 : forall xs : list nat, length (encode_3 xs) = length xs.
Proof.
  intro xs.
  unfold encode_3.
  now rewrite map_length.
Qed.
End V65_LIST_MAP_003.

