(* V65 standard-library interoperability module *)
(* FAMILY: list-map *)
(* OBLIGATIONS: 2 *)

Module V65_LIST_MAP_037.
Require Import Coq.Lists.List.
Import ListNotations.

Definition encode_37 (xs : list nat) : list nat := map (fun x => x) xs.

Theorem encode_id_37 : forall xs : list nat, encode_37 xs = xs.
Proof.
  intro xs.
  unfold encode_37.
  now rewrite map_id.
Qed.

Theorem encode_length_37 : forall xs : list nat, length (encode_37 xs) = length xs.
Proof.
  intro xs.
  unfold encode_37.
  now rewrite map_length.
Qed.
End V65_LIST_MAP_037.

