(* V63 library-style representation-migration module *)
(* PATTERN: record-tuple *)
(* TRANSFER_SHAPE: section/retraction *)
(* OBLIGATIONS: 3 *)

Module V63_record_tuple_022.
Record point_22 := mkPoint_22 { x_22 : nat; y_22 : nat }.

Definition to_pair_22 (p : point_22) : nat * nat := (x_22 p, y_22 p).
Definition from_pair_22 (q : nat * nat) : point_22 := mkPoint_22 (fst q) (snd q).
Definition weight_point_22 (p : point_22) : nat := x_22 p + y_22 p.
Definition weight_pair_22 (q : nat * nat) : nat := fst q + snd q.

Theorem from_to_point_22 : forall p : point_22, from_pair_22 (to_pair_22 p) = p.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem to_from_pair_22 : forall q : nat * nat, to_pair_22 (from_pair_22 q) = q.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem weight_transfer_22 : forall p : point_22, weight_pair_22 (to_pair_22 p) = weight_point_22 p.
Proof.
  intros [a b].
  reflexivity.
Qed.
End V63_record_tuple_022.

