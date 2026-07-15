(* V63 library-style representation-migration module *)
(* PATTERN: record-tuple *)
(* TRANSFER_SHAPE: section/retraction *)
(* OBLIGATIONS: 3 *)

Module V63_record_tuple_003.
Record point_3 := mkPoint_3 { x_3 : nat; y_3 : nat }.

Definition to_pair_3 (p : point_3) : nat * nat := (x_3 p, y_3 p).
Definition from_pair_3 (q : nat * nat) : point_3 := mkPoint_3 (fst q) (snd q).
Definition weight_point_3 (p : point_3) : nat := x_3 p + y_3 p.
Definition weight_pair_3 (q : nat * nat) : nat := fst q + snd q.

Theorem from_to_point_3 : forall p : point_3, from_pair_3 (to_pair_3 p) = p.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem to_from_pair_3 : forall q : nat * nat, to_pair_3 (from_pair_3 q) = q.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem weight_transfer_3 : forall p : point_3, weight_pair_3 (to_pair_3 p) = weight_point_3 p.
Proof.
  intros [a b].
  reflexivity.
Qed.
End V63_record_tuple_003.

