(* V63 library-style representation-migration module *)
(* PATTERN: record-tuple *)
(* TRANSFER_SHAPE: section/retraction *)
(* OBLIGATIONS: 3 *)

Module V63_record_tuple_027.
Record point_27 := mkPoint_27 { x_27 : nat; y_27 : nat }.

Definition to_pair_27 (p : point_27) : nat * nat := (x_27 p, y_27 p).
Definition from_pair_27 (q : nat * nat) : point_27 := mkPoint_27 (fst q) (snd q).
Definition weight_point_27 (p : point_27) : nat := x_27 p + y_27 p.
Definition weight_pair_27 (q : nat * nat) : nat := fst q + snd q.

Theorem from_to_point_27 : forall p : point_27, from_pair_27 (to_pair_27 p) = p.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem to_from_pair_27 : forall q : nat * nat, to_pair_27 (from_pair_27 q) = q.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem weight_transfer_27 : forall p : point_27, weight_pair_27 (to_pair_27 p) = weight_point_27 p.
Proof.
  intros [a b].
  reflexivity.
Qed.
End V63_record_tuple_027.

