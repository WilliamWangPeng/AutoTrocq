(* V63 library-style representation-migration module *)
(* PATTERN: record-tuple *)
(* TRANSFER_SHAPE: section/retraction *)
(* OBLIGATIONS: 3 *)

Module V63_record_tuple_051.
Record point_51 := mkPoint_51 { x_51 : nat; y_51 : nat }.

Definition to_pair_51 (p : point_51) : nat * nat := (x_51 p, y_51 p).
Definition from_pair_51 (q : nat * nat) : point_51 := mkPoint_51 (fst q) (snd q).
Definition weight_point_51 (p : point_51) : nat := x_51 p + y_51 p.
Definition weight_pair_51 (q : nat * nat) : nat := fst q + snd q.

Theorem from_to_point_51 : forall p : point_51, from_pair_51 (to_pair_51 p) = p.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem to_from_pair_51 : forall q : nat * nat, to_pair_51 (from_pair_51 q) = q.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem weight_transfer_51 : forall p : point_51, weight_pair_51 (to_pair_51 p) = weight_point_51 p.
Proof.
  intros [a b].
  reflexivity.
Qed.
End V63_record_tuple_051.

