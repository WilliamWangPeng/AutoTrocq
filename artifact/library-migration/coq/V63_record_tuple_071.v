(* V63 library-style representation-migration module *)
(* PATTERN: record-tuple *)
(* TRANSFER_SHAPE: section/retraction *)
(* OBLIGATIONS: 3 *)

Module V63_record_tuple_071.
Record point_71 := mkPoint_71 { x_71 : nat; y_71 : nat }.

Definition to_pair_71 (p : point_71) : nat * nat := (x_71 p, y_71 p).
Definition from_pair_71 (q : nat * nat) : point_71 := mkPoint_71 (fst q) (snd q).
Definition weight_point_71 (p : point_71) : nat := x_71 p + y_71 p.
Definition weight_pair_71 (q : nat * nat) : nat := fst q + snd q.

Theorem from_to_point_71 : forall p : point_71, from_pair_71 (to_pair_71 p) = p.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem to_from_pair_71 : forall q : nat * nat, to_pair_71 (from_pair_71 q) = q.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem weight_transfer_71 : forall p : point_71, weight_pair_71 (to_pair_71 p) = weight_point_71 p.
Proof.
  intros [a b].
  reflexivity.
Qed.
End V63_record_tuple_071.

