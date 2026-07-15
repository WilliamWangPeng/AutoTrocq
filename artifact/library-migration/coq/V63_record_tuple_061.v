(* V63 library-style representation-migration module *)
(* PATTERN: record-tuple *)
(* TRANSFER_SHAPE: section/retraction *)
(* OBLIGATIONS: 3 *)

Module V63_record_tuple_061.
Record point_61 := mkPoint_61 { x_61 : nat; y_61 : nat }.

Definition to_pair_61 (p : point_61) : nat * nat := (x_61 p, y_61 p).
Definition from_pair_61 (q : nat * nat) : point_61 := mkPoint_61 (fst q) (snd q).
Definition weight_point_61 (p : point_61) : nat := x_61 p + y_61 p.
Definition weight_pair_61 (q : nat * nat) : nat := fst q + snd q.

Theorem from_to_point_61 : forall p : point_61, from_pair_61 (to_pair_61 p) = p.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem to_from_pair_61 : forall q : nat * nat, to_pair_61 (from_pair_61 q) = q.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem weight_transfer_61 : forall p : point_61, weight_pair_61 (to_pair_61 p) = weight_point_61 p.
Proof.
  intros [a b].
  reflexivity.
Qed.
End V63_record_tuple_061.

