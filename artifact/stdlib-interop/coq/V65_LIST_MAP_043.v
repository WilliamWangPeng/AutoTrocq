(* V65 standard-library interoperability module *)
(* FAMILY: list-map *)
(* OBLIGATIONS: 2 *)

Module V65_LIST_MAP_043.
Require Import Coq.Lists.List.
Import ListNotations.

Definition encode_43 (xs : list nat) : list nat := map (fun x => x) xs.

Theorem encode_id_43 : forall xs : list nat, encode_43 xs = xs.
Proof.
  intro xs.
  unfold encode_43.
  now rewrite map_id.
Qed.

Theorem encode_length_43 : forall xs : list nat, length (encode_43 xs) = length xs.
Proof.
  intro xs.
  unfold encode_43.
  now rewrite map_length.
Qed.
End V65_LIST_MAP_043.

