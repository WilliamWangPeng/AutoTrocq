(* V63 library-style representation-migration module *)
(* PATTERN: record-tuple *)
(* TRANSFER_SHAPE: section/retraction *)
(* OBLIGATIONS: 3 *)

Module V63_record_tuple_059.
Record point_59 := mkPoint_59 { x_59 : nat; y_59 : nat }.

Definition to_pair_59 (p : point_59) : nat * nat := (x_59 p, y_59 p).
Definition from_pair_59 (q : nat * nat) : point_59 := mkPoint_59 (fst q) (snd q).
Definition weight_point_59 (p : point_59) : nat := x_59 p + y_59 p.
Definition weight_pair_59 (q : nat * nat) : nat := fst q + snd q.

Theorem from_to_point_59 : forall p : point_59, from_pair_59 (to_pair_59 p) = p.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem to_from_pair_59 : forall q : nat * nat, to_pair_59 (from_pair_59 q) = q.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem weight_transfer_59 : forall p : point_59, weight_pair_59 (to_pair_59 p) = weight_point_59 p.
Proof.
  intros [a b].
  reflexivity.
Qed.
End V63_record_tuple_059.

