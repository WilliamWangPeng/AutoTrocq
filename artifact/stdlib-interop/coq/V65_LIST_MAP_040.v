(* V65 standard-library interoperability module *)
(* FAMILY: list-map *)
(* OBLIGATIONS: 2 *)

Module V65_LIST_MAP_040.
Require Import Coq.Lists.List.
Import ListNotations.

Definition encode_40 (xs : list nat) : list nat := map (fun x => x) xs.

Theorem encode_id_40 : forall xs : list nat, encode_40 xs = xs.
Proof.
  intro xs.
  unfold encode_40.
  now rewrite map_id.
Qed.

Theorem encode_length_40 : forall xs : list nat, length (encode_40 xs) = length xs.
Proof.
  intro xs.
  unfold encode_40.
  now rewrite map_length.
Qed.
End V65_LIST_MAP_040.

