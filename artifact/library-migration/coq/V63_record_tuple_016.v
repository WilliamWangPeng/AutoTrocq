(* V63 library-style representation-migration module *)
(* PATTERN: record-tuple *)
(* TRANSFER_SHAPE: section/retraction *)
(* OBLIGATIONS: 3 *)

Module V63_record_tuple_016.
Record point_16 := mkPoint_16 { x_16 : nat; y_16 : nat }.

Definition to_pair_16 (p : point_16) : nat * nat := (x_16 p, y_16 p).
Definition from_pair_16 (q : nat * nat) : point_16 := mkPoint_16 (fst q) (snd q).
Definition weight_point_16 (p : point_16) : nat := x_16 p + y_16 p.
Definition weight_pair_16 (q : nat * nat) : nat := fst q + snd q.

Theorem from_to_point_16 : forall p : point_16, from_pair_16 (to_pair_16 p) = p.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem to_from_pair_16 : forall q : nat * nat, to_pair_16 (from_pair_16 q) = q.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem weight_transfer_16 : forall p : point_16, weight_pair_16 (to_pair_16 p) = weight_point_16 p.
Proof.
  intros [a b].
  reflexivity.
Qed.
End V63_record_tuple_016.

