(* V63 library-style representation-migration module *)
(* PATTERN: record-tuple *)
(* TRANSFER_SHAPE: section/retraction *)
(* OBLIGATIONS: 3 *)

Module V63_record_tuple_035.
Record point_35 := mkPoint_35 { x_35 : nat; y_35 : nat }.

Definition to_pair_35 (p : point_35) : nat * nat := (x_35 p, y_35 p).
Definition from_pair_35 (q : nat * nat) : point_35 := mkPoint_35 (fst q) (snd q).
Definition weight_point_35 (p : point_35) : nat := x_35 p + y_35 p.
Definition weight_pair_35 (q : nat * nat) : nat := fst q + snd q.

Theorem from_to_point_35 : forall p : point_35, from_pair_35 (to_pair_35 p) = p.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem to_from_pair_35 : forall q : nat * nat, to_pair_35 (from_pair_35 q) = q.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem weight_transfer_35 : forall p : point_35, weight_pair_35 (to_pair_35 p) = weight_point_35 p.
Proof.
  intros [a b].
  reflexivity.
Qed.
End V63_record_tuple_035.

