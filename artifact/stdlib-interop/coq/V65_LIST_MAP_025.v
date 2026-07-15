(* V65 standard-library interoperability module *)
(* FAMILY: list-map *)
(* OBLIGATIONS: 2 *)

Module V65_LIST_MAP_025.
Require Import Coq.Lists.List.
Import ListNotations.

Definition encode_25 (xs : list nat) : list nat := map (fun x => x) xs.

Theorem encode_id_25 : forall xs : list nat, encode_25 xs = xs.
Proof.
  intro xs.
  unfold encode_25.
  now rewrite map_id.
Qed.

Theorem encode_length_25 : forall xs : list nat, length (encode_25 xs) = length xs.
Proof.
  intro xs.
  unfold encode_25.
  now rewrite map_length.
Qed.
End V65_LIST_MAP_025.

