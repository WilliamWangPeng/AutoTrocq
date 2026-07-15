(* V63 library-style representation-migration module *)
(* PATTERN: record-tuple *)
(* TRANSFER_SHAPE: section/retraction *)
(* OBLIGATIONS: 3 *)

Module V63_record_tuple_009.
Record point_9 := mkPoint_9 { x_9 : nat; y_9 : nat }.

Definition to_pair_9 (p : point_9) : nat * nat := (x_9 p, y_9 p).
Definition from_pair_9 (q : nat * nat) : point_9 := mkPoint_9 (fst q) (snd q).
Definition weight_point_9 (p : point_9) : nat := x_9 p + y_9 p.
Definition weight_pair_9 (q : nat * nat) : nat := fst q + snd q.

Theorem from_to_point_9 : forall p : point_9, from_pair_9 (to_pair_9 p) = p.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem to_from_pair_9 : forall q : nat * nat, to_pair_9 (from_pair_9 q) = q.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem weight_transfer_9 : forall p : point_9, weight_pair_9 (to_pair_9 p) = weight_point_9 p.
Proof.
  intros [a b].
  reflexivity.
Qed.
End V63_record_tuple_009.

