(* V63 library-style representation-migration module *)
(* PATTERN: record-tuple *)
(* TRANSFER_SHAPE: section/retraction *)
(* OBLIGATIONS: 3 *)

Module V63_record_tuple_018.
Record point_18 := mkPoint_18 { x_18 : nat; y_18 : nat }.

Definition to_pair_18 (p : point_18) : nat * nat := (x_18 p, y_18 p).
Definition from_pair_18 (q : nat * nat) : point_18 := mkPoint_18 (fst q) (snd q).
Definition weight_point_18 (p : point_18) : nat := x_18 p + y_18 p.
Definition weight_pair_18 (q : nat * nat) : nat := fst q + snd q.

Theorem from_to_point_18 : forall p : point_18, from_pair_18 (to_pair_18 p) = p.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem to_from_pair_18 : forall q : nat * nat, to_pair_18 (from_pair_18 q) = q.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem weight_transfer_18 : forall p : point_18, weight_pair_18 (to_pair_18 p) = weight_point_18 p.
Proof.
  intros [a b].
  reflexivity.
Qed.
End V63_record_tuple_018.

