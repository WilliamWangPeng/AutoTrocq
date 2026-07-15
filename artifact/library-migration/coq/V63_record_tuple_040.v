(* V63 library-style representation-migration module *)
(* PATTERN: record-tuple *)
(* TRANSFER_SHAPE: section/retraction *)
(* OBLIGATIONS: 3 *)

Module V63_record_tuple_040.
Record point_40 := mkPoint_40 { x_40 : nat; y_40 : nat }.

Definition to_pair_40 (p : point_40) : nat * nat := (x_40 p, y_40 p).
Definition from_pair_40 (q : nat * nat) : point_40 := mkPoint_40 (fst q) (snd q).
Definition weight_point_40 (p : point_40) : nat := x_40 p + y_40 p.
Definition weight_pair_40 (q : nat * nat) : nat := fst q + snd q.

Theorem from_to_point_40 : forall p : point_40, from_pair_40 (to_pair_40 p) = p.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem to_from_pair_40 : forall q : nat * nat, to_pair_40 (from_pair_40 q) = q.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem weight_transfer_40 : forall p : point_40, weight_pair_40 (to_pair_40 p) = weight_point_40 p.
Proof.
  intros [a b].
  reflexivity.
Qed.
End V63_record_tuple_040.

