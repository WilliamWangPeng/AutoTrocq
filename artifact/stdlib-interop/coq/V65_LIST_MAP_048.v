(* V65 standard-library interoperability module *)
(* FAMILY: list-map *)
(* OBLIGATIONS: 2 *)

Module V65_LIST_MAP_048.
Require Import Coq.Lists.List.
Import ListNotations.

Definition encode_48 (xs : list nat) : list nat := map (fun x => x) xs.

Theorem encode_id_48 : forall xs : list nat, encode_48 xs = xs.
Proof.
  intro xs.
  unfold encode_48.
  now rewrite map_id.
Qed.

Theorem encode_length_48 : forall xs : list nat, length (encode_48 xs) = length xs.
Proof.
  intro xs.
  unfold encode_48.
  now rewrite map_length.
Qed.
End V65_LIST_MAP_048.

