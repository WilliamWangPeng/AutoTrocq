(* V63 library-style representation-migration module *)
(* PATTERN: record-tuple *)
(* TRANSFER_SHAPE: section/retraction *)
(* OBLIGATIONS: 3 *)

Module V63_record_tuple_029.
Record point_29 := mkPoint_29 { x_29 : nat; y_29 : nat }.

Definition to_pair_29 (p : point_29) : nat * nat := (x_29 p, y_29 p).
Definition from_pair_29 (q : nat * nat) : point_29 := mkPoint_29 (fst q) (snd q).
Definition weight_point_29 (p : point_29) : nat := x_29 p + y_29 p.
Definition weight_pair_29 (q : nat * nat) : nat := fst q + snd q.

Theorem from_to_point_29 : forall p : point_29, from_pair_29 (to_pair_29 p) = p.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem to_from_pair_29 : forall q : nat * nat, to_pair_29 (from_pair_29 q) = q.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem weight_transfer_29 : forall p : point_29, weight_pair_29 (to_pair_29 p) = weight_point_29 p.
Proof.
  intros [a b].
  reflexivity.
Qed.
End V63_record_tuple_029.

