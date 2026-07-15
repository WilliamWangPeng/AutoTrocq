(* V63 library-style representation-migration module *)
(* PATTERN: record-tuple *)
(* TRANSFER_SHAPE: section/retraction *)
(* OBLIGATIONS: 3 *)

Module V63_record_tuple_067.
Record point_67 := mkPoint_67 { x_67 : nat; y_67 : nat }.

Definition to_pair_67 (p : point_67) : nat * nat := (x_67 p, y_67 p).
Definition from_pair_67 (q : nat * nat) : point_67 := mkPoint_67 (fst q) (snd q).
Definition weight_point_67 (p : point_67) : nat := x_67 p + y_67 p.
Definition weight_pair_67 (q : nat * nat) : nat := fst q + snd q.

Theorem from_to_point_67 : forall p : point_67, from_pair_67 (to_pair_67 p) = p.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem to_from_pair_67 : forall q : nat * nat, to_pair_67 (from_pair_67 q) = q.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem weight_transfer_67 : forall p : point_67, weight_pair_67 (to_pair_67 p) = weight_point_67 p.
Proof.
  intros [a b].
  reflexivity.
Qed.
End V63_record_tuple_067.

