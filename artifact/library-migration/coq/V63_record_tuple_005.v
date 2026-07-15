(* V63 library-style representation-migration module *)
(* PATTERN: record-tuple *)
(* TRANSFER_SHAPE: section/retraction *)
(* OBLIGATIONS: 3 *)

Module V63_record_tuple_005.
Record point_5 := mkPoint_5 { x_5 : nat; y_5 : nat }.

Definition to_pair_5 (p : point_5) : nat * nat := (x_5 p, y_5 p).
Definition from_pair_5 (q : nat * nat) : point_5 := mkPoint_5 (fst q) (snd q).
Definition weight_point_5 (p : point_5) : nat := x_5 p + y_5 p.
Definition weight_pair_5 (q : nat * nat) : nat := fst q + snd q.

Theorem from_to_point_5 : forall p : point_5, from_pair_5 (to_pair_5 p) = p.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem to_from_pair_5 : forall q : nat * nat, to_pair_5 (from_pair_5 q) = q.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem weight_transfer_5 : forall p : point_5, weight_pair_5 (to_pair_5 p) = weight_point_5 p.
Proof.
  intros [a b].
  reflexivity.
Qed.
End V63_record_tuple_005.

