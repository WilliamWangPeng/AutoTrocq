(* V65 standard-library interoperability module *)
(* FAMILY: list-map *)
(* OBLIGATIONS: 2 *)

Module V65_LIST_MAP_009.
Require Import Coq.Lists.List.
Import ListNotations.

Definition encode_9 (xs : list nat) : list nat := map (fun x => x) xs.

Theorem encode_id_9 : forall xs : list nat, encode_9 xs = xs.
Proof.
  intro xs.
  unfold encode_9.
  now rewrite map_id.
Qed.

Theorem encode_length_9 : forall xs : list nat, length (encode_9 xs) = length xs.
Proof.
  intro xs.
  unfold encode_9.
  now rewrite map_length.
Qed.
End V65_LIST_MAP_009.

