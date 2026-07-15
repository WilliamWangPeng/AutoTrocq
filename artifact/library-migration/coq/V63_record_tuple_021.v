(* V63 library-style representation-migration module *)
(* PATTERN: record-tuple *)
(* TRANSFER_SHAPE: section/retraction *)
(* OBLIGATIONS: 3 *)

Module V63_record_tuple_021.
Record point_21 := mkPoint_21 { x_21 : nat; y_21 : nat }.

Definition to_pair_21 (p : point_21) : nat * nat := (x_21 p, y_21 p).
Definition from_pair_21 (q : nat * nat) : point_21 := mkPoint_21 (fst q) (snd q).
Definition weight_point_21 (p : point_21) : nat := x_21 p + y_21 p.
Definition weight_pair_21 (q : nat * nat) : nat := fst q + snd q.

Theorem from_to_point_21 : forall p : point_21, from_pair_21 (to_pair_21 p) = p.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem to_from_pair_21 : forall q : nat * nat, to_pair_21 (from_pair_21 q) = q.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem weight_transfer_21 : forall p : point_21, weight_pair_21 (to_pair_21 p) = weight_point_21 p.
Proof.
  intros [a b].
  reflexivity.
Qed.
End V63_record_tuple_021.

