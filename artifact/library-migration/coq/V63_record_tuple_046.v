(* V63 library-style representation-migration module *)
(* PATTERN: record-tuple *)
(* TRANSFER_SHAPE: section/retraction *)
(* OBLIGATIONS: 3 *)

Module V63_record_tuple_046.
Record point_46 := mkPoint_46 { x_46 : nat; y_46 : nat }.

Definition to_pair_46 (p : point_46) : nat * nat := (x_46 p, y_46 p).
Definition from_pair_46 (q : nat * nat) : point_46 := mkPoint_46 (fst q) (snd q).
Definition weight_point_46 (p : point_46) : nat := x_46 p + y_46 p.
Definition weight_pair_46 (q : nat * nat) : nat := fst q + snd q.

Theorem from_to_point_46 : forall p : point_46, from_pair_46 (to_pair_46 p) = p.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem to_from_pair_46 : forall q : nat * nat, to_pair_46 (from_pair_46 q) = q.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem weight_transfer_46 : forall p : point_46, weight_pair_46 (to_pair_46 p) = weight_point_46 p.
Proof.
  intros [a b].
  reflexivity.
Qed.
End V63_record_tuple_046.

