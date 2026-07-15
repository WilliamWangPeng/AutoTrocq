(* V63 library-style representation-migration module *)
(* PATTERN: record-tuple *)
(* TRANSFER_SHAPE: section/retraction *)
(* OBLIGATIONS: 3 *)

Module V63_record_tuple_056.
Record point_56 := mkPoint_56 { x_56 : nat; y_56 : nat }.

Definition to_pair_56 (p : point_56) : nat * nat := (x_56 p, y_56 p).
Definition from_pair_56 (q : nat * nat) : point_56 := mkPoint_56 (fst q) (snd q).
Definition weight_point_56 (p : point_56) : nat := x_56 p + y_56 p.
Definition weight_pair_56 (q : nat * nat) : nat := fst q + snd q.

Theorem from_to_point_56 : forall p : point_56, from_pair_56 (to_pair_56 p) = p.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem to_from_pair_56 : forall q : nat * nat, to_pair_56 (from_pair_56 q) = q.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem weight_transfer_56 : forall p : point_56, weight_pair_56 (to_pair_56 p) = weight_point_56 p.
Proof.
  intros [a b].
  reflexivity.
Qed.
End V63_record_tuple_056.

