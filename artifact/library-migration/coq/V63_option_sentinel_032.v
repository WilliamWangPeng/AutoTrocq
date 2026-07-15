(* V63 library-style representation-migration module *)
(* PATTERN: option-sentinel *)
(* TRANSFER_SHAPE: partial encoding *)
(* OBLIGATIONS: 3 *)

Module V63_option_sentinel_032.
Definition enc_32 (o : option nat) : nat :=
  match o with
  | None => 0
  | Some n => S n
  end.

Definition dec_32 (n : nat) : option nat :=
  match n with
  | 0 => None
  | S k => Some k
  end.

Definition size_32 (o : option nat) : nat :=
  match o with None => 0 | Some n => S n end.

Theorem dec_enc_32 : forall o : option nat, dec_32 (enc_32 o) = o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem size_transfer_32 : forall o : option nat, enc_32 o = size_32 o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem none_unique_32 : forall o : option nat, enc_32 o = 0 -> o = None.
Proof.
  destruct o; simpl; congruence.
Qed.
End V63_option_sentinel_032.

