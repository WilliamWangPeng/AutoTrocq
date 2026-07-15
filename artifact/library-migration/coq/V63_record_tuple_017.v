(* V63 library-style representation-migration module *)
(* PATTERN: record-tuple *)
(* TRANSFER_SHAPE: section/retraction *)
(* OBLIGATIONS: 3 *)

Module V63_record_tuple_017.
Record point_17 := mkPoint_17 { x_17 : nat; y_17 : nat }.

Definition to_pair_17 (p : point_17) : nat * nat := (x_17 p, y_17 p).
Definition from_pair_17 (q : nat * nat) : point_17 := mkPoint_17 (fst q) (snd q).
Definition weight_point_17 (p : point_17) : nat := x_17 p + y_17 p.
Definition weight_pair_17 (q : nat * nat) : nat := fst q + snd q.

Theorem from_to_point_17 : forall p : point_17, from_pair_17 (to_pair_17 p) = p.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem to_from_pair_17 : forall q : nat * nat, to_pair_17 (from_pair_17 q) = q.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem weight_transfer_17 : forall p : point_17, weight_pair_17 (to_pair_17 p) = weight_point_17 p.
Proof.
  intros [a b].
  reflexivity.
Qed.
End V63_record_tuple_017.

