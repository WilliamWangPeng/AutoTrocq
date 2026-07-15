(* V63 library-style representation-migration module *)
(* PATTERN: record-tuple *)
(* TRANSFER_SHAPE: section/retraction *)
(* OBLIGATIONS: 3 *)

Module V63_record_tuple_057.
Record point_57 := mkPoint_57 { x_57 : nat; y_57 : nat }.

Definition to_pair_57 (p : point_57) : nat * nat := (x_57 p, y_57 p).
Definition from_pair_57 (q : nat * nat) : point_57 := mkPoint_57 (fst q) (snd q).
Definition weight_point_57 (p : point_57) : nat := x_57 p + y_57 p.
Definition weight_pair_57 (q : nat * nat) : nat := fst q + snd q.

Theorem from_to_point_57 : forall p : point_57, from_pair_57 (to_pair_57 p) = p.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem to_from_pair_57 : forall q : nat * nat, to_pair_57 (from_pair_57 q) = q.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem weight_transfer_57 : forall p : point_57, weight_pair_57 (to_pair_57 p) = weight_point_57 p.
Proof.
  intros [a b].
  reflexivity.
Qed.
End V63_record_tuple_057.

