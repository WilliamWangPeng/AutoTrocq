(* V63 library-style representation-migration module *)
(* PATTERN: record-tuple *)
(* TRANSFER_SHAPE: section/retraction *)
(* OBLIGATIONS: 3 *)

Module V63_record_tuple_038.
Record point_38 := mkPoint_38 { x_38 : nat; y_38 : nat }.

Definition to_pair_38 (p : point_38) : nat * nat := (x_38 p, y_38 p).
Definition from_pair_38 (q : nat * nat) : point_38 := mkPoint_38 (fst q) (snd q).
Definition weight_point_38 (p : point_38) : nat := x_38 p + y_38 p.
Definition weight_pair_38 (q : nat * nat) : nat := fst q + snd q.

Theorem from_to_point_38 : forall p : point_38, from_pair_38 (to_pair_38 p) = p.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem to_from_pair_38 : forall q : nat * nat, to_pair_38 (from_pair_38 q) = q.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem weight_transfer_38 : forall p : point_38, weight_pair_38 (to_pair_38 p) = weight_point_38 p.
Proof.
  intros [a b].
  reflexivity.
Qed.
End V63_record_tuple_038.

