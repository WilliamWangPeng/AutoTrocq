(* V63 library-style representation-migration module *)
(* PATTERN: record-tuple *)
(* TRANSFER_SHAPE: section/retraction *)
(* OBLIGATIONS: 3 *)

Module V63_record_tuple_043.
Record point_43 := mkPoint_43 { x_43 : nat; y_43 : nat }.

Definition to_pair_43 (p : point_43) : nat * nat := (x_43 p, y_43 p).
Definition from_pair_43 (q : nat * nat) : point_43 := mkPoint_43 (fst q) (snd q).
Definition weight_point_43 (p : point_43) : nat := x_43 p + y_43 p.
Definition weight_pair_43 (q : nat * nat) : nat := fst q + snd q.

Theorem from_to_point_43 : forall p : point_43, from_pair_43 (to_pair_43 p) = p.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem to_from_pair_43 : forall q : nat * nat, to_pair_43 (from_pair_43 q) = q.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem weight_transfer_43 : forall p : point_43, weight_pair_43 (to_pair_43 p) = weight_point_43 p.
Proof.
  intros [a b].
  reflexivity.
Qed.
End V63_record_tuple_043.

