(* V63 library-style representation-migration module *)
(* PATTERN: record-tuple *)
(* TRANSFER_SHAPE: section/retraction *)
(* OBLIGATIONS: 3 *)

Module V63_record_tuple_026.
Record point_26 := mkPoint_26 { x_26 : nat; y_26 : nat }.

Definition to_pair_26 (p : point_26) : nat * nat := (x_26 p, y_26 p).
Definition from_pair_26 (q : nat * nat) : point_26 := mkPoint_26 (fst q) (snd q).
Definition weight_point_26 (p : point_26) : nat := x_26 p + y_26 p.
Definition weight_pair_26 (q : nat * nat) : nat := fst q + snd q.

Theorem from_to_point_26 : forall p : point_26, from_pair_26 (to_pair_26 p) = p.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem to_from_pair_26 : forall q : nat * nat, to_pair_26 (from_pair_26 q) = q.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem weight_transfer_26 : forall p : point_26, weight_pair_26 (to_pair_26 p) = weight_point_26 p.
Proof.
  intros [a b].
  reflexivity.
Qed.
End V63_record_tuple_026.

