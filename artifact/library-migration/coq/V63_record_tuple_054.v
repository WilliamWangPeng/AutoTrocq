(* V63 library-style representation-migration module *)
(* PATTERN: record-tuple *)
(* TRANSFER_SHAPE: section/retraction *)
(* OBLIGATIONS: 3 *)

Module V63_record_tuple_054.
Record point_54 := mkPoint_54 { x_54 : nat; y_54 : nat }.

Definition to_pair_54 (p : point_54) : nat * nat := (x_54 p, y_54 p).
Definition from_pair_54 (q : nat * nat) : point_54 := mkPoint_54 (fst q) (snd q).
Definition weight_point_54 (p : point_54) : nat := x_54 p + y_54 p.
Definition weight_pair_54 (q : nat * nat) : nat := fst q + snd q.

Theorem from_to_point_54 : forall p : point_54, from_pair_54 (to_pair_54 p) = p.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem to_from_pair_54 : forall q : nat * nat, to_pair_54 (from_pair_54 q) = q.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem weight_transfer_54 : forall p : point_54, weight_pair_54 (to_pair_54 p) = weight_point_54 p.
Proof.
  intros [a b].
  reflexivity.
Qed.
End V63_record_tuple_054.

