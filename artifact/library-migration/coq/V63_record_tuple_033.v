(* V63 library-style representation-migration module *)
(* PATTERN: record-tuple *)
(* TRANSFER_SHAPE: section/retraction *)
(* OBLIGATIONS: 3 *)

Module V63_record_tuple_033.
Record point_33 := mkPoint_33 { x_33 : nat; y_33 : nat }.

Definition to_pair_33 (p : point_33) : nat * nat := (x_33 p, y_33 p).
Definition from_pair_33 (q : nat * nat) : point_33 := mkPoint_33 (fst q) (snd q).
Definition weight_point_33 (p : point_33) : nat := x_33 p + y_33 p.
Definition weight_pair_33 (q : nat * nat) : nat := fst q + snd q.

Theorem from_to_point_33 : forall p : point_33, from_pair_33 (to_pair_33 p) = p.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem to_from_pair_33 : forall q : nat * nat, to_pair_33 (from_pair_33 q) = q.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem weight_transfer_33 : forall p : point_33, weight_pair_33 (to_pair_33 p) = weight_point_33 p.
Proof.
  intros [a b].
  reflexivity.
Qed.
End V63_record_tuple_033.

