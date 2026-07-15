(* V63 library-style representation-migration module *)
(* PATTERN: record-tuple *)
(* TRANSFER_SHAPE: section/retraction *)
(* OBLIGATIONS: 3 *)

Module V63_record_tuple_044.
Record point_44 := mkPoint_44 { x_44 : nat; y_44 : nat }.

Definition to_pair_44 (p : point_44) : nat * nat := (x_44 p, y_44 p).
Definition from_pair_44 (q : nat * nat) : point_44 := mkPoint_44 (fst q) (snd q).
Definition weight_point_44 (p : point_44) : nat := x_44 p + y_44 p.
Definition weight_pair_44 (q : nat * nat) : nat := fst q + snd q.

Theorem from_to_point_44 : forall p : point_44, from_pair_44 (to_pair_44 p) = p.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem to_from_pair_44 : forall q : nat * nat, to_pair_44 (from_pair_44 q) = q.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem weight_transfer_44 : forall p : point_44, weight_pair_44 (to_pair_44 p) = weight_point_44 p.
Proof.
  intros [a b].
  reflexivity.
Qed.
End V63_record_tuple_044.

