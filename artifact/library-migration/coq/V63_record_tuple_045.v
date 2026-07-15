(* V63 library-style representation-migration module *)
(* PATTERN: record-tuple *)
(* TRANSFER_SHAPE: section/retraction *)
(* OBLIGATIONS: 3 *)

Module V63_record_tuple_045.
Record point_45 := mkPoint_45 { x_45 : nat; y_45 : nat }.

Definition to_pair_45 (p : point_45) : nat * nat := (x_45 p, y_45 p).
Definition from_pair_45 (q : nat * nat) : point_45 := mkPoint_45 (fst q) (snd q).
Definition weight_point_45 (p : point_45) : nat := x_45 p + y_45 p.
Definition weight_pair_45 (q : nat * nat) : nat := fst q + snd q.

Theorem from_to_point_45 : forall p : point_45, from_pair_45 (to_pair_45 p) = p.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem to_from_pair_45 : forall q : nat * nat, to_pair_45 (from_pair_45 q) = q.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem weight_transfer_45 : forall p : point_45, weight_pair_45 (to_pair_45 p) = weight_point_45 p.
Proof.
  intros [a b].
  reflexivity.
Qed.
End V63_record_tuple_045.

