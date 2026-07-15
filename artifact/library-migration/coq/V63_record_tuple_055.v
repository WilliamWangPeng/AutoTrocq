(* V63 library-style representation-migration module *)
(* PATTERN: record-tuple *)
(* TRANSFER_SHAPE: section/retraction *)
(* OBLIGATIONS: 3 *)

Module V63_record_tuple_055.
Record point_55 := mkPoint_55 { x_55 : nat; y_55 : nat }.

Definition to_pair_55 (p : point_55) : nat * nat := (x_55 p, y_55 p).
Definition from_pair_55 (q : nat * nat) : point_55 := mkPoint_55 (fst q) (snd q).
Definition weight_point_55 (p : point_55) : nat := x_55 p + y_55 p.
Definition weight_pair_55 (q : nat * nat) : nat := fst q + snd q.

Theorem from_to_point_55 : forall p : point_55, from_pair_55 (to_pair_55 p) = p.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem to_from_pair_55 : forall q : nat * nat, to_pair_55 (from_pair_55 q) = q.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem weight_transfer_55 : forall p : point_55, weight_pair_55 (to_pair_55 p) = weight_point_55 p.
Proof.
  intros [a b].
  reflexivity.
Qed.
End V63_record_tuple_055.

