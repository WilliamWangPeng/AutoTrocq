(* V63 library-style representation-migration module *)
(* PATTERN: record-tuple *)
(* TRANSFER_SHAPE: section/retraction *)
(* OBLIGATIONS: 3 *)

Module V63_record_tuple_034.
Record point_34 := mkPoint_34 { x_34 : nat; y_34 : nat }.

Definition to_pair_34 (p : point_34) : nat * nat := (x_34 p, y_34 p).
Definition from_pair_34 (q : nat * nat) : point_34 := mkPoint_34 (fst q) (snd q).
Definition weight_point_34 (p : point_34) : nat := x_34 p + y_34 p.
Definition weight_pair_34 (q : nat * nat) : nat := fst q + snd q.

Theorem from_to_point_34 : forall p : point_34, from_pair_34 (to_pair_34 p) = p.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem to_from_pair_34 : forall q : nat * nat, to_pair_34 (from_pair_34 q) = q.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem weight_transfer_34 : forall p : point_34, weight_pair_34 (to_pair_34 p) = weight_point_34 p.
Proof.
  intros [a b].
  reflexivity.
Qed.
End V63_record_tuple_034.

