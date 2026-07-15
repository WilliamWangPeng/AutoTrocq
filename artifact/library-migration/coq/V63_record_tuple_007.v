(* V63 library-style representation-migration module *)
(* PATTERN: record-tuple *)
(* TRANSFER_SHAPE: section/retraction *)
(* OBLIGATIONS: 3 *)

Module V63_record_tuple_007.
Record point_7 := mkPoint_7 { x_7 : nat; y_7 : nat }.

Definition to_pair_7 (p : point_7) : nat * nat := (x_7 p, y_7 p).
Definition from_pair_7 (q : nat * nat) : point_7 := mkPoint_7 (fst q) (snd q).
Definition weight_point_7 (p : point_7) : nat := x_7 p + y_7 p.
Definition weight_pair_7 (q : nat * nat) : nat := fst q + snd q.

Theorem from_to_point_7 : forall p : point_7, from_pair_7 (to_pair_7 p) = p.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem to_from_pair_7 : forall q : nat * nat, to_pair_7 (from_pair_7 q) = q.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem weight_transfer_7 : forall p : point_7, weight_pair_7 (to_pair_7 p) = weight_point_7 p.
Proof.
  intros [a b].
  reflexivity.
Qed.
End V63_record_tuple_007.

