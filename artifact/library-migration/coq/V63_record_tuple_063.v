(* V63 library-style representation-migration module *)
(* PATTERN: record-tuple *)
(* TRANSFER_SHAPE: section/retraction *)
(* OBLIGATIONS: 3 *)

Module V63_record_tuple_063.
Record point_63 := mkPoint_63 { x_63 : nat; y_63 : nat }.

Definition to_pair_63 (p : point_63) : nat * nat := (x_63 p, y_63 p).
Definition from_pair_63 (q : nat * nat) : point_63 := mkPoint_63 (fst q) (snd q).
Definition weight_point_63 (p : point_63) : nat := x_63 p + y_63 p.
Definition weight_pair_63 (q : nat * nat) : nat := fst q + snd q.

Theorem from_to_point_63 : forall p : point_63, from_pair_63 (to_pair_63 p) = p.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem to_from_pair_63 : forall q : nat * nat, to_pair_63 (from_pair_63 q) = q.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem weight_transfer_63 : forall p : point_63, weight_pair_63 (to_pair_63 p) = weight_point_63 p.
Proof.
  intros [a b].
  reflexivity.
Qed.
End V63_record_tuple_063.

