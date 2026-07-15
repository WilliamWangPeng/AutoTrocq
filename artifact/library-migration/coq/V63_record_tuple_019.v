(* V63 library-style representation-migration module *)
(* PATTERN: record-tuple *)
(* TRANSFER_SHAPE: section/retraction *)
(* OBLIGATIONS: 3 *)

Module V63_record_tuple_019.
Record point_19 := mkPoint_19 { x_19 : nat; y_19 : nat }.

Definition to_pair_19 (p : point_19) : nat * nat := (x_19 p, y_19 p).
Definition from_pair_19 (q : nat * nat) : point_19 := mkPoint_19 (fst q) (snd q).
Definition weight_point_19 (p : point_19) : nat := x_19 p + y_19 p.
Definition weight_pair_19 (q : nat * nat) : nat := fst q + snd q.

Theorem from_to_point_19 : forall p : point_19, from_pair_19 (to_pair_19 p) = p.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem to_from_pair_19 : forall q : nat * nat, to_pair_19 (from_pair_19 q) = q.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem weight_transfer_19 : forall p : point_19, weight_pair_19 (to_pair_19 p) = weight_point_19 p.
Proof.
  intros [a b].
  reflexivity.
Qed.
End V63_record_tuple_019.

