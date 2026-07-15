(* V63 library-style representation-migration module *)
(* PATTERN: record-tuple *)
(* TRANSFER_SHAPE: section/retraction *)
(* OBLIGATIONS: 3 *)

Module V63_record_tuple_065.
Record point_65 := mkPoint_65 { x_65 : nat; y_65 : nat }.

Definition to_pair_65 (p : point_65) : nat * nat := (x_65 p, y_65 p).
Definition from_pair_65 (q : nat * nat) : point_65 := mkPoint_65 (fst q) (snd q).
Definition weight_point_65 (p : point_65) : nat := x_65 p + y_65 p.
Definition weight_pair_65 (q : nat * nat) : nat := fst q + snd q.

Theorem from_to_point_65 : forall p : point_65, from_pair_65 (to_pair_65 p) = p.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem to_from_pair_65 : forall q : nat * nat, to_pair_65 (from_pair_65 q) = q.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem weight_transfer_65 : forall p : point_65, weight_pair_65 (to_pair_65 p) = weight_point_65 p.
Proof.
  intros [a b].
  reflexivity.
Qed.
End V63_record_tuple_065.

