(* V63 library-style representation-migration module *)
(* PATTERN: record-tuple *)
(* TRANSFER_SHAPE: section/retraction *)
(* OBLIGATIONS: 3 *)

Module V63_record_tuple_036.
Record point_36 := mkPoint_36 { x_36 : nat; y_36 : nat }.

Definition to_pair_36 (p : point_36) : nat * nat := (x_36 p, y_36 p).
Definition from_pair_36 (q : nat * nat) : point_36 := mkPoint_36 (fst q) (snd q).
Definition weight_point_36 (p : point_36) : nat := x_36 p + y_36 p.
Definition weight_pair_36 (q : nat * nat) : nat := fst q + snd q.

Theorem from_to_point_36 : forall p : point_36, from_pair_36 (to_pair_36 p) = p.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem to_from_pair_36 : forall q : nat * nat, to_pair_36 (from_pair_36 q) = q.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem weight_transfer_36 : forall p : point_36, weight_pair_36 (to_pair_36 p) = weight_point_36 p.
Proof.
  intros [a b].
  reflexivity.
Qed.
End V63_record_tuple_036.

